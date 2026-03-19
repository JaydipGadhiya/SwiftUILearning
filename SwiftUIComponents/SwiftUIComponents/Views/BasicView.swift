//
//  BasicView.swift
//  SwiftUIComponents
//
//  Created by Jaydip Gadhiya on 18/03/26.
//

import SwiftUI

struct BasicView: View {
    let title: String
    var body: some View {
        if title == "Text" {
            VStack {
                Text("Hello World !! Good Morning")
                    .font(.system(size: 25, design: .serif))
                    .fontWeight(.bold)
                
                Divider()
                    .frame(height: 5)
                    .background(.red)
                    .clipShape(.capsule)
                    .padding()
                
                Text("Hello World !! Good Morning")
                    .font(.title)
                    .fontWeight(.medium)
                    .foregroundStyle(.blue)
                    .multilineTextAlignment(.center)
                    .lineLimit(1)
                    .truncationMode(.tail)
                    .padding()
    
                Text("Hello World !! Good Morning")
                    .font(.title)
                    .fontWeight(.medium)
                    .lineSpacing(5)
                    .kerning(2)
                    .multilineTextAlignment(.center)
                    .padding()
                
                Text("Hello World !! Good Morning")
                    .font(.title)
                    .fontWeight(.medium)
                    .tracking(10)
                    .padding()
                
                
                Text("Hello World !! Good Morning")
                    .font(.title)
                    .fontWeight(.medium)
                    .italic()
                    .underline(true, color: .blue)
                    .strikethrough(true, color: .red)
                    .padding()
                
                Text("Hello World !! Good Morning")
                    .font(.title)
                    .fontWeight(.medium)
                    .textCase(.uppercase)
                    .padding()
                
                Text("Hello World !! Good Morning")
                    .font(.title)
                    .fontWeight(.medium)
                    .shadow(color: .red, radius: 5)
                    .lineLimit(1)
                    .padding()
                Spacer()
            }
            .padding()
        } else if title == "Image" {
            VStack {
                HStack {
                    Image("sample")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                    
                    
                    Image("sample")
                        .resizable()
                        .scaledToFit()
                        .clipShape(RoundedRectangle(cornerRadius: 10.0, style: .continuous))
                }
               
                .padding()
                
                HStack {
                    Image("sample")
                        .resizable()
                        .scaledToFit()
                        .mask(Circle())
                        .overlay(
                            Text("Hello")
                                .foregroundColor(.white)
                                .font(.title)
                        )
                    
                    Image("sample")
                        .resizable()
                        .scaledToFit()
                        .border(.black, width: 2)
                        .mask(Circle())
                        .overlay(
                            Text("Hello")
                                .foregroundColor(.white)
                                .font(.title)
                        )
                }
                Spacer()
            }
        } else if title == "Label" {
            VStack {
                Label("Hello World !! SwiftUI", image: "")
                    .font(.headline)
                    .foregroundStyle(.blue)
                    .padding()
 
                Label {
                    Text("Label With Icon")
                        .font(.default)
                        .fontWeight(.semibold)
                } icon: {
                    Image(systemName: "heart.fill")
                        .foregroundStyle(.red)
                }
                .padding()
                
                Label("Download", systemImage: "arrow.down.circle")
                    .padding()
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(10)
                    .font(.title3)
                    .padding()
                
                HStack {
                    Label("Left", systemImage: "arrow.left")
                    Spacer()
                    Label("Right", systemImage: "arrow.right")
                }
                
                
                Label("Hello SwiftUI", systemImage: "")
                    .labelStyle(.titleOnly)
                    .underline(true, pattern: .dashDotDot, color: Color.red)
                    .padding()
                
                Label("Hello Tap me", image: "")
                    .labelStyle(.titleOnly)
                    .underline(true, pattern: .dashDotDot, color: Color.red)
                    .onTapGesture {
                        print("Someone tapped me")
                    }
                
                Spacer()
            }
            .padding()
        } else if title == "Divider" {
            VStack {
                Divider()
                    .padding()
                
                Divider()
                    .background(Color.red)
                    .padding()
                
                Divider()
                    .frame(height: 6)
                    .background(.red)
                    .padding()
                
                
                Divider()
                    .frame(height: 5)
                    .overlay(Color.blue)
                    .padding()
                
                HStack {
                    Text("Left")
                    Divider()
                        .frame(width: 5, height: 30)
                        .background(Color.gray)
                    Text("Right")
                }
                .padding()
                
                Spacer()
            }
            .padding()
        } else if title == "Spacer" {
            HStack {
                Text("Left")
                Spacer()
                Text("Right")
            }
            .padding()
            
            VStack {
                Text("Left")
                Spacer()
                Text("Right")
            }
            .padding()
        }
       
    }
}

#Preview {
    BasicView(title: "Spacer")
}
