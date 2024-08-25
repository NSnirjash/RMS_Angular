import { Component } from '@angular/core';

@Component({
  selector: 'app-sidenav',
  templateUrl: './sidenav.component.html',
  styleUrl: './sidenav.component.css'
})
export class SidenavComponent {

  openNav() {
    document.getElementById("mySidenav")?.classList.add("open");
    document.getElementById("main")?.classList.add("shift");
  }

  closeNav() {
    document.getElementById("mySidenav")?.classList.remove("open");
    document.getElementById("main")?.classList.remove("shift");
  }
}
