//
//  ImageDataModel.swift
//  Dreamify
//
//  Created by Joey Wiryawan on 06/07/23.
//

import Foundation


struct ImageData: Identifiable {
    var id = UUID()
    let name: String
    let title: String
    let audio: String
    let description: String
    let caption: String
}

let images = [
    ImageData(name: "Enchanted Garden", title: "Enchanted Garden", audio: "Enchanted_Garden", description: "When we think of a garden, we often imagine a place full of brightly glazed flowers along with the sound of pristine water fountain. Have you actually visited a garden who possess these traits? Even if you haven't, worry not. Cover your eyes and experience it yourself as you fall deep into slumber.", caption: "Rain on Rooftop"),
    ImageData(name: "Oceanic Venture", title: "Oceanic Venture", audio: "Oceanic_Venture", description: "Whatever lies deep in the ocean will forever remain a mystery. Have you ever wondered what it feels to sail through the magnificent colossus sized of water? Before you fall deeper into your unconscious state, let's have a quick venture, shall we?", caption: "Crashing Waves"),
    ImageData(name: "Merchant of Hearts", title: "Merchant of Hearts", audio: "Merchant_of_Hearts", description: "Adora was a reputable merchant for her expertise in potions, vials, and spells that could help with all kinds of love troubles. Despite being called the infamous Merchant of Hearts, Adora stumbled into a love problem with Mark, the guy whom she fell in love with. Can her potion brewing and enchantments be able to fix it? ", caption: "Rain & Thunder"),
    ImageData(name: "Grumpy Dorian", title: "Grumpy Dorian", audio: "Grumpy_Dorian", description: "You spilled on his favorite jacket? Unforgivable! Dorian was merely a little kid with a big temper. Whoever got in his way, they’re deemed unforgivable by this grumpy little kid. Are you one of those people, perhaps?", caption: "Snowfall")
]
