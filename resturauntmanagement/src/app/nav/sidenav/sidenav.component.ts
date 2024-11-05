import { Component } from '@angular/core';
import { UserModel } from '../../model/user.model';
import { AuthService } from '../../service/auth.service';

@Component({
  selector: 'app-sidenav',
  templateUrl: './sidenav.component.html',
  styleUrl: './sidenav.component.css'
})
export class SidenavComponent {

  userRole: string | null = '';
  currentUser: UserModel| null = null;

  constructor(private authService:AuthService){

  }


  ngOnInit(): void {
    this.setupDropdowns();
  }

  setupDropdowns(): void {
    this.authService.currentUser$.subscribe(user => {
      this.currentUser = user;
      this.userRole = user?.role || null;
    });

    const dropdowns = document.getElementsByClassName("dropdown-btn");

    for (let i = 0; i < dropdowns.length; i++) {
      dropdowns[i].addEventListener("click", (event) => {
        const currentDropdown = event.currentTarget as HTMLElement;
        currentDropdown.classList.toggle("active");
        const dropdownContent = currentDropdown.nextElementSibling as HTMLElement;
        if (dropdownContent.style.display === "block") {
          dropdownContent.style.display = "none";
        } else {
          dropdownContent.style.display = "block";
        }
      });
    }
  }
}
