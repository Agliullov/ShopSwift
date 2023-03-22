//
//  MainView.swift
//  ShopSwift
//
//  Created by Ильдар Аглиуллов on 14.03.2023.
//

import SwiftUI
import AGLUI
import AGLDomain

struct MainView: View {
    
    private let loader = NetworkDataBlockOperationLoader()
    
    @State private var latestModel: LatestProductsModel?
    @State private var flashModel: FlashSaleProductsModel?
    @State private var detailsModel: DetailsProductsModel?
    
    @EnvironmentObject var coordinator: Coordinator<MainRouter>
    
    var body: some View {
        VStack {
            //MARK: - Navigation bar
            CustomNavigationBarView()
            
            //MARK: - Categories stack
            CategoriesView()
            
            Spacer()
            
            //MARK: - Latest & Flash sale & Brands items
            ScrollView(.vertical, showsIndicators: false) {
                // Latest
                VStack(alignment: .leading, spacing: 8.0) {
                    HStack(alignment: .center, spacing: 12.0) {
                        Text("Latest")
                            .font(.custom(Montserrat.semiBold, size: 18.0))
                            .foregroundColor(Color(uiColor: .label))
                        Spacer()
                        Button {
                            print("View all Latest")
                        } label: {
                            Text("View all")
                                .font(.custom(Montserrat.regular, size: 12.0))
                                .foregroundColor(Color(uiColor: .systemGray))
                        }
                    }
                    ScrollView(.horizontal, showsIndicators: false) {
                        if let latestModel = self.latestModel {
                            HStack {
                                ForEach(Array(latestModel.latest.enumerated()), id: \.element) { _, model in
                                    LatestElementView(viewModel: model)
                                }
                            }
                        } else {
                            HStack {
                                ForEach(1..<5) { _ in
                                    LatestDelayView()
                                }
                            }
                        }
                    }
                }
                .padding(.horizontal, 12.0)
                
                Spacer()
                
                // Flash sale
                VStack(alignment: .leading, spacing: 8.0) {
                    HStack(alignment: .center, spacing: 12.0) {
                        Text("Flash sale")
                            .font(.custom(Montserrat.semiBold, size: 18.0))
                            .foregroundColor(Color(uiColor: .label))
                        Spacer()
                        Button {
                            print("View all Flash sale")
                        } label: {
                            Text("View all")
                                .font(.custom(Montserrat.regular, size: 12.0))
                                .foregroundColor(Color(uiColor: .systemGray))
                        }
                    }
                    ScrollView(.horizontal, showsIndicators: false) {
                        if let flashModel = self.flashModel {
                            HStack {
                                ForEach(Array(flashModel.flashSale.enumerated()), id: \.element) { _, model in
                                    FlashSaleElementView(viewModel: model).onTapGesture {
                                        if let detailsModel = detailsModel {
                                            coordinator.show(.details(viewModel: detailsModel))
                                        }
                                    }
                                }
                            }
                        } else {
                            HStack {
                                ForEach(1..<5) { _ in
                                    FlashSaleDelayView()
                                }
                            }
                        }
                    }
                }
                .padding(.horizontal, 12.0)
                
                Spacer()
                
                // Brands
                VStack(alignment: .leading, spacing: 8.0) {
                    HStack(alignment: .center, spacing: 12.0) {
                        Text("Brands")
                            .font(.custom(Montserrat.semiBold, size: 18.0))
                            .foregroundColor(Color(uiColor: .label))
                        Spacer()
                        Button {
                            print("View all Brands")
                        } label: {
                            Text("View all")
                                .font(.custom(Montserrat.regular, size: 12.0))
                                .foregroundColor(Color(uiColor: .systemGray))
                        }
                    }
                    ScrollView(.horizontal, showsIndicators: false) {
                        if let latestModel = self.latestModel {
                            HStack {
                                ForEach(Array(latestModel.latest.enumerated()), id: \.element) { _, model in
                                    LatestElementView(viewModel: model)
                                }
                            }
                        } else {
                            HStack {
                                ForEach(1..<5) { _ in
                                    LatestDelayView()
                                }
                            }
                        }
                    }
                }
                .padding(.horizontal, 12.0)
            }
        }
        .onAppear {
            loader.loadData { latestModel, flashModel in
                if let latestModel = latestModel, let flashModel = flashModel {
                    self.latestModel = latestModel
                    self.flashModel = flashModel
                }
            }
            
            fetchDetails { detailsModel in
                if let detailsModel = detailsModel {
                    self.detailsModel = detailsModel
                }
            }
        }
    }
}

extension MainView {
    func fetchDetails(completion: @escaping (DetailsProductsModel?) -> Void) {
        let url = "https://run.mocky.io/v3/f7f99d04-4971-45d5-92e0-70333383c239"
        let network = NetworkDataFetcher()
        network.getDataUrlFromJson(urlString: url, response: completion)
    }
}
