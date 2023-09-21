//
//  WeatherView.swift
//  WeatherApp
//
//  Created by Kevin Zhang on 9/20/23.
//

import SwiftUI

struct WeatherView: View {
    var weather: ResponseBody
    var body: some View {
        ZStack(alignment: .leading){
            VStack{
                VStack(alignment: .leading, spacing: 5) {
                    Text(weather.name)
                        .bold().font(.title)
                    Text("Today, \(Date().formatted(.dateTime.month().day().hour().minute()))")
                        .fontWeight(.light)
                }
                .frame(maxWidth:.infinity,alignment:.leading)
                
                Spacer()
                
                VStack{
                    HStack{
                        VStack(spacing: 20){
                            Image(systemName: "sun.max")
                                .font(.system(size:40))
                            Text(weather.weather[0].main)
                        }
                        .frame(width: 150, alignment: .leading)
                        
                        Spacer()
                        
                        Text(weather.main.feelsLike.roundDouble() + "°")
                            .font(.system(size: 100))
                            .fontWeight(.bold)
                            .padding()
                    }
                    Spacer()
                        .frame(height: 80)
                    AsyncImage(url: URL(string: "https://i.ibb.co/BK8RVxV/city-1.png")) { image in image
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 350)
                    } placeholder: {
                        ProgressView()
                    }
                    Spacer()
                }
                .frame(maxWidth: .infinity)
            }
            .padding()
            .frame(maxWidth:.infinity,alignment:.leading)
            
            VStack{
                Spacer()
                VStack(alignment: .leading,spacing: 20){
                    Text("Weather Today")
                        .bold().padding(.bottom)
                    HStack{
                        WeatherRow(logo: "thermometer", name: "Min Temp", value: (weather.main.tempMin.roundDouble())+"°")
                            .background(Color(hue: 0.6, saturation: 0.65, brightness: 1.0, opacity: 0.30))
                            .cornerRadius(5)
                        Spacer()
                        WeatherRow(logo: "thermometer", name: "Max Temp", value: (weather.main.tempMax.roundDouble())+"°")
                            .background(Color(hue: 0.001, saturation: 0.693, brightness: 1.0, opacity: 0.30))
                            .cornerRadius(5)
                    }
                }
                .frame(maxWidth:.infinity, alignment: .leading)
                .padding()
                .padding(.bottom,20)
                .foregroundColor(.black)
                .background(.white)
                .cornerRadius(20, corners: [.topLeft,.topRight])
            }
        }
        .edgesIgnoringSafeArea(.bottom)
        .background(Color.blue)
        .preferredColorScheme(.dark)
    }
}

struct WeatherView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherView(weather: previewWeather)
    }
}
