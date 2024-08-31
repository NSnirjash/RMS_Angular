import { Component } from '@angular/core';

@Component({
  selector: 'app-navbar',
  templateUrl: './navbar.component.html',
  styleUrl: './navbar.component.css'
})
export class NavbarComponent {

  searchQuery: string = '';

  handleSearch(event: Event) {
    event.preventDefault();
    // Handle the search logic here
    console.log('Search query:', this.searchQuery);
    // You can implement actual search logic or route to a search page
  }
}
