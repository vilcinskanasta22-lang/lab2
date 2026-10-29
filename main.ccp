#include <iostream>
#include <fstream>
#include "CarRental.h"

int main() {
    std::cout << "=== CAR RENTAL SYSTEM - 13 REQUIREMENTS DEMONSTRATION ===\n\n";
    std::cout << "--- [Requirement 5] Creating objects in static and dynamic memory ---\n";

    CarRental staticCars[5] = {
        CarRental("Toyota", "Camry", 5, 120.0, false, "John Doe", "AB123456", "Pending"),
        CarRental("Renault", "Logan", 3, 60.0, false, "Jane Smith", "CD789012", "Pending"),
        CarRental("BMW", "X5", 7, 350.0, false, "Michael Johnson", "EF345678", "Pending"),
        CarRental("Skoda", "Octavia", 4, 100.0, false, "Emily Davis", "GH901234", "Pending"),
        CarRental("Ford", "Focus", 2, 80.0, false, "David Brown", "IJ567890", "Pending")
    };

    CarRental* dynamicCars[5];
    dynamicCars[0] = new CarRental("Audi", "A6", 6, 280.0, false, "Chris Wilson", "KL111222", "Pending");
    dynamicCars[1] = new CarRental("Hyundai", "Accent", 5, 70.0, false, "Sarah Taylor", "MN333444", "Pending");
    dynamicCars[2] = new CarRental("Kia", "Rio", 3, 65.0, false, "James Anderson", "OP555666", "Pending");
    dynamicCars[3] = new CarRental("Volkswagen", "Passat", 8, 150.0, false, "Jessica Thomas", "QR777888", "Pending");
    dynamicCars[4] = new CarRental("Nissan", "Leaf", 2, 90.0, false, "Daniel Martinez", "ST999000", "Pending");
    std::cout << "Successfully initialized 5 static objects and 5 dynamic objects.\n\n";

    std::cout << "--- [Requirement 6] Defining two object arrays ---\n";
    std::cout << "Array 1 (staticCars) and Array 2 (dynamicCars) are successfully defined.\n\n";
    std::cout << "--- [Requirement 7] Working with objects inside the array ---\n";
    std::cout << "Modifying data of the first element in the static array:\n";
    staticCars[0].clientName_ = "Johnathan Doe Jr.";
    staticCars[0].display();
    std::cout << "\n";
    std::cout << "--- [Requirement 8] Demonstrating all class methods ---\n";
    double standardCost = staticCars[0].calculateTotalCost();
    double discountedCost = staticCars[0].calculateTotalCost(15.0); 
    std::cout << "Standard cost: $" << standardCost << " | With 15% discount: $" << discountedCost << "\n";
    staticCars[0].processAdminDecision(true, "");
    staticCars[1].processAdminDecision(false, "Invalid passport document format");
    staticCars[0].markDamage(true);
    std::cout << "State after method executions:\n";
    staticCars[0].display();
    std::cout << "\n";
    std::cout << "--- [Requirement 4] Writing and reading from file ---\n";
    {
        std::ofstream outFile("car_rental_data.txt");
        if (outFile.is_open()) {
            staticCars[0].writeToFile(outFile);
            outFile.close();
            std::cout << "Data successfully written to 'car_rental_data.txt'.\n";
        }
    }

    {
        std::ifstream inFile("car_rental_data.txt");
        CarRental fileLoadedCar;
        if (inFile.is_open()) {
            fileLoadedCar.readFromFile(inFile);
            inFile.close();
            std::cout << "Data successfully read back from file:\n";
            fileLoadedCar.display();
        }
    }
    std::cout << "\n";
    staticCars[2].processRandomDataArray();
    std::cout << "\n";
    std::cout << "--- [Requirement 10] Using a pointer to a class instance ---\n";
    CarRental* ptrCar = &staticCars[3]; 
    std::cout << "Accessing members and methods via pointer (->):\n";
    ptrCar->processAdminDecision(true, "");
    ptrCar->display();
    std::cout << "\n";



    for (int i = 0; i < 5; ++i) {
        delete dynamicCars[i];
    }

    std::cout << "=== ALL 13 REQUIREMENTS SUCCESSFULLY COMPLETED ===\n";
    return 0;
}
