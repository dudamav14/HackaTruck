//
//  ReconhecimentoFala.swift
//  telaAnotacoes
//
//  Created by Turma02-7 on 12/03/25.
//

import Foundation
import Speech
import AVFoundation

class ReconhecimentoFala: NSObject, SFSpeechRecognizerDelegate, ObservableObject {
    private let recognizer = SFSpeechRecognizer(locale: Locale(identifier: "pt-BR"))
    private var recognitionRequest: SFSpeechAudioBufferRecognitionRequest?
    private var recognitionTask: SFSpeechRecognitionTask?
    private let audioEngine = AVAudioEngine()
    
    func transcribe(completion: @escaping (String) -> Void) {
        guard let recognizer = recognizer, recognizer.isAvailable else { return }
        
        recognitionRequest = SFSpeechAudioBufferRecognitionRequest()
        let inputNode = audioEngine.inputNode
        let recordingFormat = inputNode.outputFormat(forBus: 0)
        inputNode.installTap(onBus: 0, bufferSize: 1024, format: recordingFormat) { (buffer, _) in
            self.recognitionRequest?.append(buffer)
        }
        
        audioEngine.prepare()
        try? audioEngine.start()
        
        recognitionTask = recognizer.recognitionTask(with: recognitionRequest!) { result, error in
            if let result = result {
                completion(result.bestTranscription.formattedString)
            }
            if error != nil {
                self.stopTranscribing()
            }
        }
    }
    
    func stopTranscribing() {
        audioEngine.stop()
        recognitionRequest?.endAudio()
        recognitionTask?.cancel()
    }
}
