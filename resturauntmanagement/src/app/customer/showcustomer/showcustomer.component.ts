import { Component, OnInit } from '@angular/core';
import { CustomerModel } from '../../model/customer.model';
import { CustomerService } from '../../service/customer.service';
import { Router } from '@angular/router';
import { UserModel } from '../../model/user.model';

@Component({
  selector: 'app-showcustomer',
  templateUrl: './showcustomer.component.html',
  styleUrl: './showcustomer.component.css'
})
export class ShowcustomerComponent implements OnInit{

  customers: UserModel[] = [];

  constructor(private customerService: CustomerService,
    private router: Router
  ) {

  }

  ngOnInit(): void {
    this.getCustomers();
  }

  getCustomers(): void {
    this.customerService.getCustomers().subscribe((users: UserModel[]) => {
      this.customers = users.filter(user => user.role === 'customer');
    });
  }

  deleteCustomer(id: number): void {
    this.customerService.deleteCustomer(id).subscribe(() => {
      // this.customers = this.customers.filter(customer => customer.id !== id);
    });
  }

  updateCustomer(id: number): void {
    // Define the method to navigate to the edit route
    this.router.navigate(['updatecustomer', id]);
  }
}
