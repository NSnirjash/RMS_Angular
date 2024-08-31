import { Component, OnInit } from '@angular/core';
import { CustomerModel } from '../../model/customer.model';
import { CustomerService } from '../../service/customer.service';
import { Router } from '@angular/router';

<<<<<<< Updated upstream
=======

>>>>>>> Stashed changes
@Component({
  selector: 'app-showcustomer',
  templateUrl: './showcustomer.component.html',
  styleUrl: './showcustomer.component.css'
})
<<<<<<< Updated upstream
export class ShowcustomerComponent implements OnInit{

  customers: CustomerModel[] = [];

  constructor(private customerService: CustomerService,
=======
export class ShowcustomerComponent implements OnInit {
  customers: CustomerModel[] = [];

  constructor(
    private customerService: CustomerService,
>>>>>>> Stashed changes
    private router: Router
  ) {

  }

  ngOnInit(): void {
    this.loadCustomers();
  }

<<<<<<< Updated upstream
  loadCustomers(): void {
    this.customerService.getCustomers().subscribe(data => {
=======
  loadCustomers() {
    this.customerService.getCustomers().subscribe((data: CustomerModel[]) => {
>>>>>>> Stashed changes
      this.customers = data;
    });
  }

<<<<<<< Updated upstream
  deleteCustomer(id: string): void {
    this.customerService.deleteCustomer(id).subscribe(() => {
      this.customers = this.customers.filter(customer => customer.customerId !== id);
    });
  }

  updateCustomer(id: string): void {
    // Define the method to navigate to the edit route
    this.router.navigate(['updatecustomer', id]);
  }
=======

  deleteCustomer(id: string) {
    this.customerService.deleteCustomer(id).subscribe(() => {
      this.loadCustomers(); // Refresh the list after deletion
    });
  }

  editCustomer(id: string) {
    // Navigate to the UpdateCustomerComponent with the given customer ID
    this.router.navigate(['/updatecustomer', id]);
  }

>>>>>>> Stashed changes
}
