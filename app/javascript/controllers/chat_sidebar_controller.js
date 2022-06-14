import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["tabOne", "tabTwo", "tab", "tabHeader"]

  connect() {
    console.log("hello from chat sidebar")
  }

  toggleTabs(event) {
    event.preventDefault();
    console.log(this.tabTargets)
    // when a tab is selected, hide the other tab
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
    currentTab.classList.add("active");
  }

}
