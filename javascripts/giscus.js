(function () {
    const giscusConfig = {
        src: "https://giscus.app/client.js",
        "data-repo": "licyk/SDNote",
        "data-repo-id": "R_kgDOL0EOiA",
        "data-category": "Comment",
        "data-category-id": "DIC_kwDOL0EOiM4Ce_qH",
        "data-mapping": "pathname",
        "data-strict": "0",
        "data-reactions-enabled": "1",
        "data-emit-metadata": "0",
        "data-input-position": "bottom",
        "data-theme": "preferred_color_scheme",
        "data-lang": "zh-CN",
        crossorigin: "anonymous",
        async: "",
    };

    function loadGiscus() {
        const content = document.querySelector(".md-content__inner");
        if (!content || content.querySelector(".giscus-container")) {
            return;
        }

        const container = document.createElement("div");
        container.className = "giscus-container";

        const script = document.createElement("script");
        for (const [key, value] of Object.entries(giscusConfig)) {
            script.setAttribute(key, value);
        }

        container.appendChild(script);
        content.appendChild(container);
    }

    if (typeof document$ !== "undefined") {
        document$.subscribe(loadGiscus);
    } else if (document.readyState === "loading") {
        document.addEventListener("DOMContentLoaded", loadGiscus);
    } else {
        loadGiscus();
    }
})();
