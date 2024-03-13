//
//  ProfileEditor.swift
//  Landmarks
//
//  Created by Gamıd Khalıdov on 19.02.2024.
//

import SwiftUI

struct ProfileEditor: View {
    
    var dateRange: ClosedRange<Date> {
            let min = Calendar.current.date(byAdding: .year, value: -1, to: profile.goalDate)!
            let max = Calendar.current.date(byAdding: .year, value: 1, to: profile.goalDate)!
            return min...max
        }
    
    @Binding var profile: Profile
    var body: some View {
        List{
            HStack {
                Text("Username")
                Spacer()
                TextField("Username", text: $profile.username)
                    .foregroundStyle(.secondary)
                    .multilineTextAlignment(.trailing)
            }
            
            Toggle(isOn: $profile.prefersNotifications) {
                Text("Enable Notification")
            }
            
            Picker("Select Sea", selection: $profile.seasonalPhoto) {
                ForEach(Profile.Season.allCases){ season in
                    Text(season.rawValue).tag(season)
                    
                }
            }
            
            DatePicker(selection: $profile.goalDate, in: dateRange, displayedComponents: .date){
                Text("Goal Date")
            }
        }
        
    }
}

#Preview {
    ProfileEditor(profile: .constant(.default))
}
