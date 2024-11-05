import { Component, OnInit } from '@angular/core';
import { FormBuilder, FormGroup, Validators } from '@angular/forms';
import { UserModel } from '../../model/user.model';
import { AuthService } from '../../service/auth.service';
import { ActivatedRoute } from '@angular/router';

@Component({
  selector: 'app-register',
  templateUrl: './registration.component.html',
  styleUrls: ['./registration.component.css']
})
export class RegistrationComponent implements OnInit {
  regForm!: FormGroup;
  isStaff: boolean = false; // Flag to check if the user is staff

  constructor(
    private fb: FormBuilder, 
    private authService: AuthService,
    private route: ActivatedRoute // Inject ActivatedRoute to access route parameters
  ) {}

  ngOnInit(): void {
    // Get the 'type' parameter from the route
    const userType = this.route.snapshot.paramMap.get('type');

    // Initialize the form group with the default role based on the URL parameter
    this.regForm = this.fb.group({
      name: ['', Validators.required],
      email: ['', [Validators.required, Validators.email]],
      password: ['', Validators.required],
      role: [userType || 'customer', Validators.required], // Set default role from URL or fallback to 'customer'
      phoneNumber: [''],
      address: [''],
      position: [''],
      hireDate: [''],
      employmentStatus: [''],
      shiftSchedule: [''],
      salary: ['']
    });

    // Determine if the role is 'staff' based on the URL parameter
    this.isStaff = userType === 'staff';

    // Watch the role field to determine if additional fields should be shown
    this.regForm.get('role')?.valueChanges.subscribe(role => {
      this.isStaff = role === 'staff';
      this.updateFormValidation();
    });

    // Update the form validation based on initial role
    this.updateFormValidation();
  }

  updateFormValidation(): void {
    if (this.isStaff) {
      // If the user is staff, add validators for staff-specific fields
      this.regForm.get('phoneNumber')?.setValidators([Validators.required]);
      this.regForm.get('position')?.setValidators([Validators.required]);
      this.regForm.get('hireDate')?.setValidators([Validators.required]);
      this.regForm.get('employmentStatus')?.setValidators([Validators.required]);
      this.regForm.get('shiftSchedule')?.setValidators([Validators.required]);
      this.regForm.get('salary')?.setValidators([Validators.required]);
    } else {
      // Clear validators for customer
      this.regForm.get('phoneNumber')?.clearValidators();
      this.regForm.get('position')?.clearValidators();
      this.regForm.get('hireDate')?.clearValidators();
      this.regForm.get('employmentStatus')?.clearValidators();
      this.regForm.get('shiftSchedule')?.clearValidators();
      this.regForm.get('salary')?.clearValidators();
    }

    // Update validity of form controls
    this.regForm.get('phoneNumber')?.updateValueAndValidity();
    this.regForm.get('position')?.updateValueAndValidity();
    this.regForm.get('hireDate')?.updateValueAndValidity();
    this.regForm.get('employmentStatus')?.updateValueAndValidity();
    this.regForm.get('shiftSchedule')?.updateValueAndValidity();
    this.regForm.get('salary')?.updateValueAndValidity();
  }

  onSubmit(): void {
    if (this.regForm.valid) {
      const user: UserModel = this.regForm.value;
      // Send the registration data to the auth service
      this.authService.registration(user).subscribe(() => {
        alert('Registration successful!');
      });
    } else {
      alert('Please fill out the form correctly.');
    }
  }
}
