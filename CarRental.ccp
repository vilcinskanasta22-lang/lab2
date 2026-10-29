#include "CarRental.h"

CarRental::CarRental()
    : brand_("Unknown"), model_("Unknown"), rentalDays_(0), dailyRate_(0.0),
    isDamaged_(false), clientName_("None"), passportData_("None"),
    orderStatus_("Pending") {
}

CarRental::CarRental(std::string brand, std::string model, int rentalDays,
    double dailyRate, bool isDamaged, std::string clientName,
    std::string passportData, std::string orderStatus)
    : brand_(brand), model_(model), rentalDays_(rentalDays), dailyRate_(dailyRate),
    isDamaged_(isDamaged), clientName_(clientName), passportData_(passportData),
    orderStatus_(orderStatus) {
}

CarRental::~CarRental() = default;
std::string CarRental::getBrand() const { return brand_; }
void CarRental::setBrand(const std::string& brand) { brand_ = brand; }
std::string CarRental::getModel() const { return model_; }
void CarRental::setModel(const std::string& model) { model_ = model; }
int CarRental::getRentalDays() const { return rentalDays_; }
void CarRental::setRentalDays(int days) { rentalDays_ = (days > 0 ? days : 0); }
double CarRental::getDailyRate() const { return dailyRate_; }
void CarRental::setDailyRate(double rate) { dailyRate_ = (rate > 0 ? rate : 0.0); }
bool CarRental::getIsDamaged() const { return isDamaged_; }
void CarRental::setIsDamaged(bool damaged) { isDamaged_ = damaged; }
double CarRental::calculateTotalCost() const {
    return rentalDays_ * dailyRate_;
}

double CarRental::calculateTotalCost(double discountPercent) const {
    double total = rentalDays_ * dailyRate_;
    if (discountPercent > 0.0 && discountPercent <= 100.0) {
        total -= total * (discountPercent / 100.0);
    }
    return total;
}

void CarRental::processAdminDecision(bool approved, const std::string& reason) {
    if (approved) {
        orderStatus_ = "Approved";
        std::cout << "[Admin] Application for client " << clientName_ << " has been APPROVED.\n";
    }
    else {
        orderStatus_ = "Rejected: " + reason;
        std::cout << "[Admin] Application REJECTED. Reason: " << reason << "\n";
    }
}

void CarRental::markDamage(bool damaged) {
    isDamaged_ = damaged;
    if (damaged) {
        std::cout << "[Vehicle] Warning: Damage recorded for " << brand_ << " " << model_ << ".\n";
    }
    else {
        std::cout << "[Vehicle] Vehicle inspected, no damages found.\n";
    }
}

void CarRental::writeToFile(std::ofstream& outFile) const {
    if (outFile.is_open()) {
        outFile << brand_ << '\n'
            << model_ << '\n'
            << rentalDays_ << '\n'
            << dailyRate_ << '\n'
            << isDamaged_ << '\n'
            << clientName_ << '\n'
            << passportData_ << '\n'
            << orderStatus_ << '\n';
    }
}

void CarRental::readFromFile(std::ifstream& inFile) {
    if (inFile.is_open()) {
        std::getline(inFile, brand_);
        std::getline(inFile, model_);
        inFile >> rentalDays_;
        inFile >> dailyRate_;
        inFile >> isDamaged_;
        inFile.ignore(); 
        std::getline(inFile, clientName_);
        std::getline(inFile, passportData_);
        std::getline(inFile, orderStatus_);
    }
}

void CarRental::processRandomDataArray() {
    std::random_device rd;
    std::mt19937 gen(rd());
    std::uniform_int_distribution<> sizeDist(5, 10);
    int size = sizeDist(gen);
    int* dynamicArray = new int[size];
    std::uniform_int_distribution<> valDist(1, 30);
    for (int i = 0; i < size; ++i) {
        dynamicArray[i] = valDist(gen);
    }

    std::cout << "\n[Dynamic Memory - Requirement 9] Generated raw array of size " << size << ": ";
    for (int i = 0; i < size; ++i) {
        std::cout << dynamicArray[i] << " ";
    }
    std::cout << "\n";
    std::sort(dynamicArray, dynamicArray + size);
    std::cout << "[Dynamic Memory - Requirement 9] Sorted array: ";
    for (int i = 0; i < size; ++i) {
        std::cout << dynamicArray[i] << " ";
    }
    std::cout << "\n";
    delete[] dynamicArray;
}

void CarRental::display() const {
    std::cout << "Car: " << brand_ << " " << model_
        << " | Client: " << clientName_
        << " | Passport: " << passportData_
        << " | Days: " << rentalDays_
        << " | Rate/Day: $" << dailyRate_
        << " | Status: " << orderStatus_
        << " | Damaged: " << (isDamaged_ ? "Yes" : "No") << "\n";
}
