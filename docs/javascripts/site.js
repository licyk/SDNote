(function () {
    const siteScriptConfig = {
        src: "https://licyk-blog-umami.netlify.app/script.js",
        "data-website-id": "4c62b57d-8425-479e-a7b2-4673ffa3bfe4",
        defer: "",
    };

    function loadSiteScript() {
        const selector = `script[src="${siteScriptConfig.src}"][data-website-id="${siteScriptConfig["data-website-id"]}"]`;
        if (document.querySelector(selector)) {
            return;
        }

        const script = document.createElement("script");
        for (const [key, value] of Object.entries(siteScriptConfig)) {
            script.setAttribute(key, value);
        }

        document.head.appendChild(script);
    }

    if (typeof document$ !== "undefined") {
        document$.subscribe(loadSiteScript);
    } else if (document.readyState === "loading") {
        document.addEventListener("DOMContentLoaded", loadSiteScript);
    } else {
        loadSiteScript();
    }
})();
