import { Component } from '@angular/core';
import { CustomerModel } from '../../model/customer.model';
import { CustomerService } from '../../service/customer.service';
import { Router } from '@angular/router';
import { HttpClient } from '@angular/common/http';
import { FormBuilder, FormGroup } from '@angular/forms';

@Component({
  selector: 'app-createcustomer',
  templateUrl: './createcustomer.component.html',
  styleUrl: './createcustomer.component.css'
})
export class CreatecustomerComponent {
  // customer: CustomerModel = new CustomerModel();

  // constructor(private customerService: CustomerService, private router: Router) {}

  // createCustomer(): void {
  //   this.customerService.createCustomer(this.customer).subscribe(() => {
  //     this.router.navigate(['/customers']);  // Adjust routing as necessary
  //   });
  // }

  customer: CustomerModel = new CustomerModel();
  formValue!: FormGroup;
  locationData: any;

  constructor(
    private customerService: CustomerService,
    private router: Router,
    private http: HttpClient,
    private formBuilder: FormBuilder
    
  ) {

  }


  ngOnInit(): void {

    this.formValue = this.formBuilder.group({
      customerName: [''],
      customerEmail: [''],
      customerCell: [''],
      customerAddress: ['']
    }
    );
  }


  createCustomer() {

    this.customer.customerName = this.formValue.value.customerName;
    this.customer.customerEmail = this.formValue.value.customerEmail;
    this.customer.customerCell = this.formValue.value.customerCell;
    this.customer.customerAddress = this.formValue.value.customerAddress;

    
    this.customerService.createCustomer(this.customer)
      .subscribe({
          next: res=>
          {
            console.log(res);
            this.formValue.reset();
            this.router.navigate(['/customers']);
          },

          error: error=>
          {
            console.log(error);
          }

        });

  }

}
