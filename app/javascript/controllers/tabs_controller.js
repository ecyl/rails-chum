
import { Controller } from "@hotwired/stimulus"


export default class extends Controller {
  static targets = ['tabHeader', 'one', 'two', 'three', 'content']
  connect() {
    console.log("Connected to the new tabs controller.")
  }

  toggleTab(e) {
    const tabs = this.tabHeaderTargets;
    console.log(tabs);
    console.log(e.currentTarget);

    // Change tabs to inactive
    tabs.forEach((tab) => {
      tab.classList.remove("active")
    })
    // Set selected tab to active
    e.currentTarget.classList.add("active");

    // Match to selected div and display
    const contents = this.contentTargets;
    contents.forEach((content) => {
      content.classList.remove("active")
    })

    console.log(e.currentTarget.dataset.tab);
    const currentTab = this[`${e.currentTarget.dataset.tab}Target`];
    console.log(currentTab)
    currentTab.classList.add("active");


  }


}
