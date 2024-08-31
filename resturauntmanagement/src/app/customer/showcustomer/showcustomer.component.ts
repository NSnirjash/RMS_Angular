import { Component, OnInit } from '@angular/core';
import { CustomerModel } from '../../model/customer.model';
import { CustomerService } from '../../service/customer.service';
import { Router } from '@angular/router';

@Component({
  selector: 'app-showcustomer',
  templateUrl: './showcustomer.component.html',
  styleUrl: './showcustomer.component.css'
})
export class ShowcustomerComponent implements OnInit{

  customers: CustomerModel[] = [];

  constructor(private customerService: CustomerService,
    private router: Router
  ) {

  }

  ngOnInit(): void {
    this.loadCustomers();
  }

  loadCustomers(): void {
    this.customerService.getCustomers().subscribe(data => {
      this.customers = data;
    });
  }

  deleteCustomer(id: string): void {
    this.customerService.deleteCustomer(id).subscribe(() => {
      this.customers = this.customers.filter(customer => customer.customerId !== id);
    });
  }

  updateCustomer(id: string): void {
    // Define the method to navigate to the edit route
    this.router.navigate(['updatecustomer', id]);
  }
}
