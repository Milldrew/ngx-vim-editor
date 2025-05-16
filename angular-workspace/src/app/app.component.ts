import {Component} from '@angular/core';
import {RouterOutlet} from '@angular/router';
import {VimTextAreaComponent} from './vim-text-area/vim-text-area.component';

@Component({
  selector: 'app-root',
  imports: [RouterOutlet,
    VimTextAreaComponent
  ],
  templateUrl: './app.component.html',
  styleUrl: './app.component.scss'
})
export class AppComponent {
}
