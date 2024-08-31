import { Component } from '@angular/core';
import { CustomerModel } from '../../model/customer.model';
import { CustomerService } from '../../service/customer.service';
import { ActivatedRoute, Router } from '@angular/router';

@Component({
  selector: 'app-updatecustomer',
  templateUrl: './updatecustomer.component.html',
  styleUrl: './updatecustomer.component.css'
})
export class UpdatecustomerComponent {

  id: string = "";
  customer: CustomerModel = new CustomerModel();

  constructor(
    private customerService: CustomerService,
    private route: ActivatedRoute,
    private router: Router
  ) {

  }
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
}
