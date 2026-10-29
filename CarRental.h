#ifndef CAR_RENTAL_H
#define CAR_RENTAL_H

#include <string>
#include <iostream>
#include <fstream>
#include <algorithm>
#include <random>

class CarRental {
private:
    std::string brand_;
    std::string model_;
    int rentalDays_;         
    double dailyRate_;
    bool isDamaged_;

public:
 
    std::string clientName_;
    std::string passportData_; 
    std::string orderStatus_;  

  
    CarRental();
    CarRental(std::string brand, std::string model, int rentalDays,
        double dailyRate, bool isDamaged, std::string clientName,
        std::string passportData, std::string orderStatus);
    ~CarRental();
    std::string getBrand() const;
    void setBrand(const std::string& brand);
    std::string getModel() const;
    void setModel(const std::string& model);
    int getRentalDays() const;
    void setRentalDays(int days);
    double getDailyRate() const;
    void setDailyRate(double rate);
    bool getIsDamaged() const;
    void setIsDamaged(bool damaged);
    double calculateTotalCost() const;                       
    double calculateTotalCost(double discountPercent) const; 
    void processAdminDecision(bool approved, const std::string& reason); 
    void markDamage(bool damaged);                         
    void writeToFile(std::ofstream& outFile) const;
    void readFromFile(std::ifstream& inFile);
    void processRandomDataArray();
    void display() const;
};

#endif 
