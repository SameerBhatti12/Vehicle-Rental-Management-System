import 'dart:developer';
import 'dart:io';

class Vehicle {
  String brand;
  String model;
  double pricePerDay;
  bool available;

  Vehicle(this.brand, this.model, this.pricePerDay, this.available);
}

class RentalSystem {
  List<Vehicle> vehicles = [];

  RentalSystem() {
    vehicles = [
      Vehicle("Toyota", "Camry", 50.0, true),
      Vehicle("Honda", "Civic", 40.0, true),
      Vehicle("Ford", "Mustang", 80.0, true),
      Vehicle("Nissan", "GTR", 100.0, true),
      Vehicle("Suzuki", "Inazuma", 35.0, true),
    ];
  }
  void addVehicle() {
    print('Enter Brand name: ');
    String brand = stdin.readLineSync() ?? '';
    print('Enter Model name: ');
    String model = stdin.readLineSync() ?? '';
    print('Enter per day price: ');
    double pricePerDay = double.parse(stdin.readLineSync()!);
    print('Enter availability: ');
    bool available = bool.parse(stdin.readLineSync()!);

    Vehicle newVehicle = Vehicle(brand, model, pricePerDay, available);
    bool isPresent = true;
    for (var vehicle in vehicles) {
      if (vehicle.brand == newVehicle.brand &&
          vehicle.model == newVehicle.model) {
        print('vehicle is already available');
      } else {
        isPresent = false;
        //List me kch add nhi kar skte jb list k elements pe loop chal rha ho.
        // vehicles.add(newVehicle);
      }
    }

    if (!isPresent) {
      vehicles.add(newVehicle);
    }
    for (var element in vehicles) {
      print(element.model +
          ' ' +
          element.brand +
          ' ' +
          element.available.toString() +
          ' ' +
          element.pricePerDay.toString() +
          ' ');
    }
  }

  void displayAvailableVehicles() {
    print("Available Vehicles:");
    for (var vehicle in vehicles) {
      if (vehicle.available) {
        print(
            "${vehicle.brand} ${vehicle.model} - \$${vehicle.pricePerDay} per day");
      }
    }
  }

  void rentVehicle(int index) {
    if (index >= 0 && index < vehicles.length) {
      if (vehicles[index].available) {
        vehicles[index].available = false;
        print(
            "You have successfully rented the ${vehicles[index].brand} ${vehicles[index].model}.");
      } else {
        print(
            "Sorry, the ${vehicles[index].brand} ${vehicles[index].model} is not available for rent.");
      }
    } else {
      print("Invalid vehicle index.");
    }
  }
}

void main() {
  RentalSystem rentalSystem = RentalSystem();

  while (true) {
    print("Welcome to the Vehicle Rental System!");
    print("1. Display Available Vehicles");
    print("2. Rent a Vehicle");
    print("3. Add a New Vehicle");
    print("4. Exit");

    stdout.write("Enter your choice: ");
    String? choice = stdin.readLineSync();

    if (choice == "1") {
      rentalSystem.displayAvailableVehicles();
    } else if (choice == "2") {
      stdout.write("Enter the index of the vehicle you want to rent: ");
      String? indexStr = stdin.readLineSync();
      int index = int.tryParse(indexStr ?? "") ?? -1;
      rentalSystem.rentVehicle(index);
    } else if (choice == "3") {
      print('enter a vehicle detail');
      rentalSystem.addVehicle();
    } else if (choice == "4") {
      print("Thank you for using the Vehicle Rental System. Goodbye!");
      break;
    } else {
      print("Invalid choice. Please try again.");
    }
  }
}
