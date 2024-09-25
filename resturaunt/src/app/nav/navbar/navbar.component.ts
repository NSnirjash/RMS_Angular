import { Component } from '@angular/core';

@Component({
  selector: 'app-navbar',
  templateUrl: './navbar.component.html',
  styleUrl: './navbar.component.css'
})
export class NavbarComponent {

  toggleSidenav() {
    const sidenav = document.getElementById('sidenav') as HTMLElement; // Cast the element to HTMLElement
    const mainContent = document.querySelector('.main-content') as HTMLElement; // Cast main content to HTMLElement

    if (sidenav.style.width === '250px' || sidenav.style.width === '') {
      sidenav.style.width = '0';
      mainContent.style.marginLeft = '0';
    } else {
      sidenav.style.width = '250px';
      mainContent.style.marginLeft = '250px';
    }
  }
}
