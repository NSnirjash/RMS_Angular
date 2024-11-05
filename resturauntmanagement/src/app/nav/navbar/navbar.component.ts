import { Component, OnInit } from '@angular/core';
import { AuthService } from '../../service/auth.service';
import { UserModel } from '../../model/user.model';

@Component({
  selector: 'app-navbar',
  templateUrl: './navbar.component.html',
  styleUrl: './navbar.component.css'
})
export class NavbarComponent implements OnInit{
  

  searchQuery: string = '';
  userRole: string | null ='';
  currentUser: UserModel| null = null;
  
  constructor(
    private authService: AuthService
  ){

  }

  ngOnInit(): void {
    this.authService.currentUser$.subscribe(user => {
      this.currentUser = user;
      this.userRole = user?.role || null;
    });
  }

  handleSearch(event: Event) {
    event.preventDefault();
    // Handle the search logic here
    console.log('Search query:', this.searchQuery);
    // You can implement actual search logic or route to a search page
  }
}
