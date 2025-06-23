//
//  ProfileEditor.swift
//  Landmarks
//
//  Created by Neil Thorne on 6/21/25.
//

import SwiftUI


struct ProfileEditor: View {
    @Binding var profile: Profile
    
    var dateRange: ClosedRange<Date> {
        let min = Calendar.current.date(byAdding: .year, value: -1, to: profile.goalDate)!
        let max = Calendar.current.date(byAdding: .year, value: 1, to: profile.goalDate)!
        return min...max
    }

    
    var body: some View {
        List {
            HStack {
                Text("Username")
                Spacer()
                TextField("Username", text: $profile.username)
                    .foregroundStyle(.secondary)
                    .multilineTextAlignment(.trailing)
            }
            
            Toggle(isOn: $profile.prefersNotifications) {
                Text("Enable Notifications")
            }
            
            // selection: what is selected
            // ForEach...Text is the text displayed for each option
            // .tag is the option value
            Picker("Seasonal Photo", selection: $profile.seasonalPhoto) {
                ForEach(Profile.Season.allCases) { season in
                    Text(season.rawValue)
                        .tag(season)
                }
            }
            
            DatePicker(selection: $profile.goalDate, in: dateRange, displayedComponents: .date) {
                Text("Goal Date")
            }
        }
    }
}

// Remember: .constant is a way to STUB IN a binding for a preview
#Preview {
    ProfileEditor(profile: .constant(.default))
}
