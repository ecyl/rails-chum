import { Controller } from "@hotwired/stimulus"


export default class extends Controller {
  static targets = ["tabOne", "tabTwo", "tabThree", "tabFour", "tab", "tabHeader"]

  connect() {
    console.log("Connected to tabs controller.")
  }

  toggleTab(event) {
    // console.log(event.currentTarget);
    // console.log(event.currentTarget.dataset.tab);
    // console.log(this.tabOneTarget)
    // console.log(this.tabTargets)

    const tabs = this.tabTargets;
    tabs.forEach((tab) => {
      tab.classList.remove("active");
    })

    const tabHeaders = this.tabHeaderTargets;
    tabHeaders.forEach((tabHeader) => {
      tabHeader.classList.remove("active");
    })

    event.currentTarget.classList.add("active");

    const currentTab = this[event.currentTarget.dataset.tab];
    // console.log(currentTab);
    currentTab.classList.add("active");


  }
}
