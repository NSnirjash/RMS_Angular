<<<<<<< Updated upstream
import { Component } from '@angular/core';
import { CustomerModel } from '../../model/customer.model';
import { CustomerService } from '../../service/customer.service';
import { ActivatedRoute, Router } from '@angular/router';
=======
import { Component, OnInit } from '@angular/core';
import { CustomerModel } from '../../model/customer.model';
import { ActivatedRoute, Router } from '@angular/router';
import { CustomerService } from '../../service/customer.service';
>>>>>>> Stashed changes

@Component({
  selector: 'app-updatecustomer',
  templateUrl: './updatecustomer.component.html',
  styleUrl: './updatecustomer.component.css'
})
<<<<<<< Updated upstream
export class UpdatecustomerComponent {

  id: string = "";
  customer: CustomerModel = new CustomerModel();

  constructor(
    private customerService: CustomerService,
    private route: ActivatedRoute,
=======
export class UpdatecustomerComponent implements OnInit {

  customer: CustomerModel = new CustomerModel();

  constructor(
    private route: ActivatedRoute,
    private customerService: CustomerService,
>>>>>>> Stashed changes
    private router: Router
  ) {

  }
<<<<<<< Updated upstream
  // ngOnInit(): void {
  //   const id = this.route.snapshot.paramMap.get('id');
  //   if (id) {
  //     this.customerService.getCustomerById(id).subscribe(data => {
  //       this.customer = data;
  //     });
  //   }
  // }

  // updateCustomer(): void {
  //   this.customerService.updateCustomer(this.customer).subscribe(() => {
  //     this.router.navigate(['/customers']);  // Adjust routing as necessary
  //   });
  // }


  ngOnInit(): void {
    this.customer = new CustomerModel();
    this.id = this.route.snapshot.params['id'];
    this.customerService.getCustomerById(this.id)
      .subscribe({
        next: res => {
          this.customer = res;
          console.log(res);
        },

        error: err => {
          console.log(err);

        }

      });

  }


  updateCustomer() {

    this.customerService.updateCustomer(this.id, this.customer)
      .subscribe({
        next: res => {
          //this.location=new Location();
          this.router.navigate(['customers']);

        },
        error: err => {
          console.log(err);

        }

      });


  }
=======

  ngOnInit(): void {
    const id = this.route.snapshot.paramMap.get('id');
    if (id) {
      this.customerService.getCustomerById(id).subscribe((data: CustomerModel) => {
        this.customer = data;
      });
    }
  }

  // onSubmit(): void {
  //   this.customerService.updateCustomer(this.customer).subscribe(() => {
  //     this.router.navigate(['/customers']);
  //   });
  // }

  onSubmit() {
    this.customerService.updateCustomer(this.customer).subscribe(() => {
      alert('Customer updated successfully');
      // Navigate away or show success message
    });
  }

>>>>>>> Stashed changes
}
