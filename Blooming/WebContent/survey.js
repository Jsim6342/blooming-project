
Survey
    .StylesManager
    .applyTheme("modern");

var json = {
    title: "우울증 진단",
    pages: [
        {
            title: "다음 문항을 읽고 각 번호의 여러 항목 중에서 요즈음 자신에게 가장 적합하다고 생각되는 번호를 하나씩만 고르세요.",
            questions: [
                {
                    type: "checkbox",
                    name: "",
                    title: "",
                    isRequired: true,
                    choices: ["나는 슬프지 않다.", "나는 슬프다.", 
							"나는 항상 슬프고 기운을 낼 수 없다.", "나는 너무나 슬프고 불행해서 도저히 견딜 수 없다."]
                }
            ]
        },{
			title: "다음 문항을 읽고 각 번호의 여러 항목 중에서 요즈음 자신에게 가장 적합하다고 생각되는 번호를 하나씩만 고르세요.",
            questions: [
                {
                    type: "checkbox",
                    name: "",
                    title: "",
                    isRequired: true,
                    choices: ["나는 앞날에 대해서 별로 낙심하지 않는다.", "나는 앞날에 대해서 용기가 나지 않는다.", 
							"나는 앞날에 대해 기대할 것이 아무것도 없다고 느낀다.", "나는 앞날은 아주 절망적이고 나아질 가망이 없다고 느낀다."]
                }
            ]
        },{
	
            title: "What language(s) are you currently using?",
            questions: [
                {
                    type: "checkbox",
                    name: "langs",
                    title: "Please select from the list",
                    colCount: 4,
                    isRequired: true,
                    choices: [
                        "Javascript",
                        "Java",
                        "Python",
                        "CSS",
                        "PHP",
                        "Ruby",
                        "C++",
                        "C",
                        "Shell",
                        "C#",
                        "Objective-C",
                        "R",
                        "VimL",
                        "Go",
                        "Perl",
                        "CoffeeScript",
                        "TeX",
                        "Swift",
                        "Scala",
                        "Emacs Lisp",
                        "Haskell",
                        "Lua",
                        "Clojure",
                        "Matlab",
                        "Arduino",
                        "Makefile",
                        "Groovy",
                        "Puppet",
                        "Rust",
                        "PowerShell"
                    ]
                }
            ]
        }, {
            title: "Please enter your name and e-mail",
            questions: [
                {
                    type: "text",
                    name: "name",
                    title: "Name:"
                }, {
                    type: "text",
                    name: "email",
                    title: "Your e-mail"
                }
            ]
        }
    ]
};

window.survey = new Survey.Model(json);

survey
    .onComplete
    .add(function (result) {
        document
            .querySelector('#surveyResult')
            .textContent = "Result JSON:\n" + JSON.stringify(result.data, null, 3);
    });

survey.showProgressBar = 'bottom';

$("#surveyElement").Survey({model: survey});