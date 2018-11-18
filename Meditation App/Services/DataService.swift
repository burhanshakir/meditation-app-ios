//
//  DataService.swift
//  Meditation App
//
//  Created by Burhanuddin Shakir on 26/09/18.
//  Copyright © 2018 meditation-app. All rights reserved.
//

import Foundation

class DataService
{
    static let instance = DataService()
    
   //Basic Chakra Cuning Meditation data
    
    private let basicChakraCuning = [
        Meditation.init(title: "8th Chakra", imageName: "8thchakra", subMeditations: []),
        Meditation.init(title: "9th Chakra", imageName: "9thchakra", subMeditations: []),
        Meditation.init(title: "10th Chakra", imageName: "10thchakra", subMeditations: []),
        Meditation.init(title: "Base", imageName: "base", subMeditations: []),
        Meditation.init(title: "Empty Mind", imageName: "empty mind", subMeditations: []),
        Meditation.init(title: "Heart", imageName: "heart", subMeditations: []),
        Meditation.init(title: "Sacrum", imageName: "sacrum", subMeditations: []),
        Meditation.init(title: "Solarplex", imageName: "solarplex", subMeditations: []),
        Meditation.init(title: "Third Eye", imageName: "thirdeye", subMeditations: []),
        Meditation.init(title: "Throat", imageName: "throat", subMeditations: [])
    ]
    
    // Advanced Chakra Cuning Data
    
    private let advChakraCuning = [
        Meditation.init(title: "Base 10th", imageName: "base-10th", subMeditations: []),
        Meditation.init(title: "Heart Crown", imageName: "heart-crown", subMeditations: []),
        Meditation.init(title: "Sacrum 9th", imageName: "sacrum - 9th", subMeditations: []),
        Meditation.init(title: "Solarplex 8th", imageName: "solarplex - 8th", subMeditations: []),
        Meditation.init(title: "Throat Third Eye", imageName: "throat - third eye", subMeditations: []),
    
        ]
    
    // Souce Code data
    
    private let sourceCode = [
        Meditation.init(title: "Creating", imageName: "1-creation", subMeditations: []),
        Meditation.init(title: "Astral", imageName: "2-astral", subMeditations: []),
        Meditation.init(title: "Forward Thinking", imageName: "3-forwardthinking", subMeditations: []),
        Meditation.init(title: "Relationships", imageName: "4-relationships", subMeditations: []),
        Meditation.init(title: "Throat", imageName: "5-throat", subMeditations: []),
        Meditation.init(title: "Envy", imageName: "6-envy", subMeditations: []),
        Meditation.init(title: "Inner Strength", imageName: "7-innerstrength", subMeditations: []),
        Meditation.init(title: "Weight", imageName: "8-weight", subMeditations: []),
        Meditation.init(title: "Sacral", imageName: "9-sacral", subMeditations: []),
        Meditation.init(title: "Sexuality", imageName: "10-sexuality", subMeditations: []),
        Meditation.init(title: "Third Eye", imageName: "11-thirdeye", subMeditations: []),
        Meditation.init(title: "Solarplex", imageName: "12-solarplex", subMeditations: []),
        Meditation.init(title: "Vision", imageName: "13-vision", subMeditations: []),
        Meditation.init(title: "Whatif", imageName: "14-whatif", subMeditations: []),
        Meditation.init(title: "Release", imageName: "15-release", subMeditations: []),
        Meditation.init(title: "Pain", imageName: "16-pain", subMeditations: []),
        Meditation.init(title: "Manifest", imageName: "17-manifest", subMeditations: []),
        Meditation.init(title: "Anger", imageName: "18-anger", subMeditations: []),
        Meditation.init(title: "Skin", imageName: "19-skin", subMeditations: []),
        Meditation.init(title: "Love", imageName: "20-love", subMeditations: []),
        Meditation.init(title: "Language", imageName: "21-language", subMeditations: []),
        Meditation.init(title: "Joy", imageName: "22-joy", subMeditations: []),
        Meditation.init(title: "Heart", imageName: "23-heart", subMeditations: []),
        Meditation.init(title: "Psychedelic", imageName: "24-psychedelic", subMeditations: []),
        Meditation.init(title: "Physical", imageName: "25-physical", subMeditations: []),
        Meditation.init(title: "Guilt", imageName: "26-guilt", subMeditations: []),
        Meditation.init(title: "Energy", imageName: "27-energy", subMeditations: []),
        Meditation.init(title: "Definitive Thinking", imageName: "28-definitivethinking", subMeditations: []),
        Meditation.init(title: "Crown", imageName: "29-crown", subMeditations: []),
        Meditation.init(title: "Clarity", imageName: "30-clarity", subMeditations: []),
        Meditation.init(title: "Centeredness", imageName: "31-centeredness", subMeditations: []),
        Meditation.init(title: "Circulation", imageName: "32-circulation", subMeditations: []),
        Meditation.init(title: "Base", imageName: "33-base", subMeditations: []),
    ]
    
    // Meditations data will remain constant
    private lazy var meditations = [
        
        Meditation.init(title: "Basic Chakra Cuning", imageName: "basic-chakra.png",subMeditations: basicChakraCuning),
        
        Meditation.init(title: "Advanced Chakra Cuning", imageName: "adv-chakra.png",subMeditations: advChakraCuning),
        
        Meditation.init(title: "Source Code", imageName: "source-code.png",subMeditations: sourceCode),
        
        Meditation.init(title: "G Space", imageName: "g-space.png",subMeditations: [])
    ]
    
    
    
    
    //Meditation Instructions data
    
    private let instructions = [
        MeditationInstructions.init(name: "Basic Chakra", description: "Learn more about the proper way to use this powerful meditation system.", instruction: "The first thing to note is that the Chakra Cuning symbols should be used with your eyes viewing the symbols stereoscopically.  Turning your phone to landscape mode will offer the best experience.\n What is stereoscopic view? It's where you defocus until you see three of the symbols side-by-side, but now they've gone 3D.\nIf you have trouble doing this, practice by holding your finger up about ten inches in front of your face, between your eyes and the image, focus on your finger and you'll see beyond your finger that it's gone stereoscopic. Then just lower your finger.\nOver time, moving into stereoscopic view will become effortless.\nUse the first symbol to empty the mind and get clear. The rest of the symbols are symbols for each designated Chakra.\nThere are ten chakras in the basic exercise, which includes three outside the confines of the 3D physical self. The advanced system brings together the symbols in pairs.\nThis meditation cunes the chakras, which opens, tunes, energizes and balances each one in turn.\nUse the basic Chakra symbol meditation at least five or six times before moving on to the advanced set.  For more information on the Advanced Chakra Cuning, please go here.\nThis meditation can be done every day and is an excellent way to start or end the day or at any time you need to clear and calm the mind."),
        
        MeditationInstructions.init(name: "Source Code", description: "Learn more about how to use these individual symbols for targetted inner work.", instruction: "To use the Source Code symbols in meditation, start by clearing your mind with the Quiet Mind tool.  You can also use the Chakra Cuning (first) symbol or even both, if you prefer.\nWhen ready, scan through the 33 thumbnails and locate the one symbol that stands out more than any other. If you know of an area where you know you need to work, go ahead and select the symbol to address it.  Whichever one you choose, click on it, which will take you to the full-sized version.\nEach symbol has a watery effect you can play with, interact with, to deepen the contact between your waking conscious mind, you, your personality, and the deeper, higher, superbeing.\nYou have nothing to do but to BE with the symbol.  Be open and receptive, with a clear and empty mind.  Play with the watery symbol as though daydreaming and be open to any information that might come through specifically for you.\nTry not to overdo it. This exercise can be very powerful. Work with it for a few minutes, and then stop, once again using your intuition for this length of time.\nFor your next session, revisit the same symbol and use your intuition to see whether or not you're finished with it for the time being. If so, move on to a different symbol using the procedure above."),
        
        MeditationInstructions.init(name: "G Space", description: "Learn more about our group meditation space", instruction: "G Space stands for Group Space.  While the other meditations are meant for individual practice, this one harnesses the energies of multiple people.  Put another way, it’s a meeting 'place' for group meditations.\nIf you have ever gone to a group sitting, you likely already know the power of collective energy.  It can be a very healing, cleansing, and invigorating experience.\nThis virtual space is consciously constructed to be free of our personal visualizations, intents or anything else we seek to generate individually. This is about allowing something beyond the scope of our personal conscious level of being to bloom.\nYou can invite friends who also have the TSB Meditation app to join you at a specified time.  Come together, get open and empty, and allow the energy to flow.\nG Space is inherently about bringing the best out of every sharer. In this way, your own personal group, be it 2 or 200, will be constantly blossoming, like a flower with as many petals as there are sharers, becoming an ever-increasingly potent transmitter of the unity ideal.")
    
    ]
    
    // Returning meditation data
    func getMeditations() -> [Meditation]
    {
        return meditations
    }
    
    
    func getMeditationInstructions() -> [MeditationInstructions]
    {
        return instructions
    }
    
    
    // Returns only 3 meditation types : Basic Chakra, Source Code, G Space
    func getBasicMeditations() -> [Meditation]
    {
        var basicMeditations = getMeditations()
        
        basicMeditations.remove(at: 1)
        
        return basicMeditations
    }
    
    
    func getLatestMeditation() -> [Meditation]
    {
        // TODO :- Check with local storage if any latest meditation was done
        let isLatestMeditationListExist = false
        
        if(!isLatestMeditationListExist)
        {
            return getBasicMeditations()
        }
        
    }
   
}
