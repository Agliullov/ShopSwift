//
//  CustomSearchBar.swift
//  ShopSwift
//
//  Created by Ильдар Аглиуллов on 17.03.2023.
//

import SwiftUI
import AGLUI
import AGLDomain
import Combine

final class SearchBarViewModel: ObservableObject {
    @Published var text: String = ""
}

struct CustomSearchBar: View {
    
    @StateObject private var viewModel = SearchBarViewModel()
    
    @State private var isEditing = false
    @State private var isShowSearch = false
    @State private var array: [String]?
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                ZStack(alignment: .trailing) {
                    HStack(alignment: .center, spacing: 12.0) {
                        TextField("What are you looking for ?", text: $viewModel.text)
                            .font(.custom(Montserrat.light, size: 12.0))
                            .multilineTextAlignment(.center)
                            .padding(.vertical, 8.0)
                            .background(Color(uiColor: .secondarySystemBackground))
                            .foregroundColor(Color(uiColor: .secondaryLabel))
                            .cornerRadius(15.0)
                            .overlay(
                                HStack {
                                    if isEditing {
                                        Button {
                                            withAnimation(.spring()) {
                                                self.viewModel.text = ""
                                            }
                                        } label: {
                                            Image(systemName: "multiply.circle.fill")
                                                .foregroundColor(.gray)
                                                .frame(minWidth: 0, maxWidth: .infinity, alignment: .trailing)
                                                .padding(.trailing, 10.0)
                                        }
                                    } else {
                                        Image(systemName: "magnifyingglass")
                                            .foregroundColor(Color(uiColor: .secondaryLabel))
                                            .frame(minWidth: 0, maxWidth: .infinity, alignment: .trailing)
                                            .padding(.trailing, 15.0)
                                    }
                                }
                            ).onTapGesture {
                                withAnimation(.spring()) {
                                    self.isEditing.toggle()
                                    self.isShowSearch.toggle()
                                }
                            }
                    }
                }
                .padding(.horizontal, 55.0)
                
                if isEditing {
                    Button {
                        withAnimation(.spring()) {
                            self.isEditing.toggle()
                            self.isShowSearch.toggle()
                        }
                        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
                    } label: {
                        Text("Отмена")
                    }
                    .padding(.trailing, 10.0)
                    .transition(.move(edge: .trailing))
                }
            }
            if isShowSearch, let array = array, viewModel.text != "" {
                
                ScrollView(.vertical, showsIndicators: false) {
                    ForEach(array.filter{ $0.localizedCaseInsensitiveContains(viewModel.text) }, id:\.self) { text in
                        Button {
                            print("tap \(text)")
                        } label: {
                            Text(text)
                                .font(.custom(Montserrat.regular, size: 15.0))
                                .foregroundColor(Color(uiColor: .label))
                                .padding(.vertical, 5.0)
                        }
                    }
                }
                .deferredRendering(for: 1.0)
                .frame(maxWidth: .infinity, maxHeight: 135.0)
                .background(Color(uiColor: .systemBackground))
            }
            
        }.onAppear {
            fetchSearch { searchModel in
                self.array = searchModel?.words
            }
        }
    }
}

extension CustomSearchBar {
    func fetchSearch(completion: @escaping (SearchProductsModel?) -> Void) {
        let url = "https://run.mocky.io/v3/4c9cd822-9479-4509-803d-63197e5a9e19"
        let network = NetworkDataFetcher()
        network.getDataUrlFromJson(urlString: url, response: completion)
    }
}
