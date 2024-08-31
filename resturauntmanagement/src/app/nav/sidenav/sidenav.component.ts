import { Component } from '@angular/core';

@Component({
  selector: 'app-sidenav',
  templateUrl: './sidenav.component.html',
  styleUrl: './sidenav.component.css'
})
export class SidenavComponent {

  ngOnInit(): void {
    this.setupDropdowns();
  }

  setupDropdowns(): void {
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
