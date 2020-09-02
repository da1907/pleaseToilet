class ToiletCard extends HTMLElement {
    constructor() {
        super();
        this.attachShadow({ mode : "open" });
    }

    get name() {
        return this.getAttribute('name');
    }

    set name(val) {
        this.setAttribute('name', val);
    }

    get category() {
        return this.getAttribute('category');
    }

    set category(val) {
        this.setAttribute('category', val);
    }

    static get observedAttributes() {
        return ["name", "category"];
    }

    attributeChangedCallback(prop, oldVal, newVal) {

    }

    connectedCallback() {
        this.render();
    }

    render() {
        this.shadowRoot.innerHTML = `
        <style>
            .log-card {
                display : flex;
                flex-direction : column;
                background-color : white;
                width : 280px;
                height : 150px;
                border-radius : 10px;
                padding : 20px;
                margin-bottom : 20px;
            }
            p {
                margin : 3px;
            }
            .name {
                font-size : 1.2rem;
            }
            .category {
                font-size : 0.9rem;
            }
            .review-button {
                width  : 270px;
                background-color : rgb(52, 152, 219);
                height : 40px;
                border-radius : 10px;
                border : none;
                outline : none;
                margin : 5px;
                position : relative;
                margin-top : 25px;
                color : white;
                font-weight : bold;
                font-size : 1rem;
            }
			.path-button {
                width  : 270px;
                background-color : rgb(52, 152, 219);
                height : 40px;
                border-radius : 10px;
                border : none;
                outline : none;
                margin : 5px;
                position : relative;
                margin-top : 25px;
                color : white;
                font-weight : bold;
                font-size : 1rem;
            }
        </style>
        <div class="toilet-card">
            <p class="name">${this.name}</p>
            <p class="category">${this.category}</p>
            <input type="button" class="path-button" value="길찾기로 연결">
            <input type="button" class="review-button" value="리뷰 보기">
        </div>
        `;
    }
}

window.customElements.define('toilet-card', ToiletCard);
/*
function addInfos(name, category) {
	const templateString = `
		<toilet-card name="${}" category="${}">
		</toilet-card>
	`;
}*/