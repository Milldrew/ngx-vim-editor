import { ComponentFixture, TestBed } from '@angular/core/testing';

import { VimTextAreaComponent } from './vim-text-area.component';

describe('VimTextAreaComponent', () => {
  let component: VimTextAreaComponent;
  let fixture: ComponentFixture<VimTextAreaComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      imports: [VimTextAreaComponent]
    })
    .compileComponents();

    fixture = TestBed.createComponent(VimTextAreaComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
