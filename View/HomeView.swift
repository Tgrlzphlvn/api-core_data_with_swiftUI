//
//  HomeView.swift
//  historyInToday_swifftUI
//
//  Created by Tuğrul Özpehlivan on 30.08.2022.
//

import SwiftUI

struct HomeView: View {
    
    @StateObject var historyInTodayViewModel = HistoryInTodayViewModel(service: HistoryInTodayService())
    
    
    var body: some View {
        NavigationView {
            List(historyInTodayViewModel.historyInToday ?? []) { data in
                
                VStack {
                    Text(data.durum?.rawValue ?? "")
                    Text(data.olay ?? "")
                    HStack {
                        Spacer()
                        Text("\(data.gun ?? "").\(data.ay ?? "").\(data.yil ?? "")")
                    }
                }
            }.navigationTitle(Text("Tarihte Bugün"))
                .toolbar {
                    ToolbarItem {
                        HStack {
                            Button("Favoriler") {
                                
                            }
                        }
                    }
                }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
