//
//  ContentView.swift
//  SwiftUI-Weather
//
//  Created by Ashwath Krishnan on 3/3/24.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isNight = false
    
    var body: some View {
        ZStack
        {
            backgroundDay(isNight: isNight)
            VStack{
            
            cityName(name: "Urbana, IL")
                    
                currentTemp(icon: isNight ? "moon.stars.fill": "cloud.sun.fill", temp: 50)
                
                HStack(spacing: 20){
                    dayWeather(day: "MON",
                               temp: 40,
                               imgName: "wind")
                    dayWeather(day: "TUE",
                               temp: 51,
                               imgName: "cloud.sun.bolt.fill")
                    dayWeather(day: "WED",
                               temp: 43,
                               imgName: "wind")
                    dayWeather(day: "THU",
                               temp: 42,
                               imgName: "cloud.snow.fill")
                    dayWeather(day: "FRI",
                               temp: 60,
                               imgName: "snow")
                }.padding(.bottom, 100)
                
                Button{
                    isNight.toggle()
                }
            label:{
                changeButton(title: "CHANGE DAY TIME", 
                             textColor: isNight ? .black : .blue,
                backgroundColor: .white)
                }
                
                Spacer()
            }
        }
    }
}

#Preview {
    ContentView()
}

struct dayWeather: View {
    var day: String
    var temp: Int
    var imgName: String
    
    var body: some View {
        VStack {
            Text(day)
                .foregroundColor(.white)
                .font(.system(size: 20, weight: .bold))
            Image(systemName:imgName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 40, height: 40)
            Text("\(temp)°")
                .foregroundColor(.white)
                .font(.system(size: 20, weight: .bold))
            
        }
    }
}

struct backgroundDay: View {
    var isNight: Bool
    
    var body: some View {

        LinearGradient(gradient: Gradient(colors: [isNight ? .black: .blue,
                                                   isNight ? .gray : Color("lightblue")]),
                       startPoint: .topLeading,
                       endPoint: .bottomTrailing)
        .edgesIgnoringSafeArea(.all)
    }
}

struct cityName: View {
    var name: String
    var body: some View {
        Text(name)
            .font(.system(size: 32, weight: .medium, design: .default))
            .foregroundColor(.white)
            .frame(width: 200, height: 100)
            .padding(.bottom, 10)
    }
}

struct currentTemp: View {
    var icon: String
    var temp: Int
    
    var body: some View {
        VStack(spacing: 10) {
            Image(systemName:icon)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 180, height: 80)
            
            Text("\(temp)°")
                .foregroundColor(.white)
                .font(.system(size: 70, weight: .medium))
        }.padding(.bottom, 50)
    }
}
