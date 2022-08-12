window.addEventListener('DOMContentLoaded', () => {
    chrome.tabs.getCurrent().then(
        (curr) => {
            chrome.tabs.update(curr.id, { url: "file:///Users/liamk/.config/chrome/newtab/newtab.html" });
            // The following unfocuses the omnibar.
            // chrome.tabs.create({ url: "file:///Users/liamk/.config/chrome/newtab/newtab.html" });
            // window.close();
        }
    )
});