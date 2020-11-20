
Survey
    .StylesManager
    .applyTheme("modern");

var json = {
    title: "우울증 진단",
    pages: [
        {
            title: "다음을 읽고 요즈음 자신에게 가장 적합하다고 생각되는 보기를 골라주세요.",
            questions: [
                {
                    type: "checkbox",
                    name: "",
                    title: "",
                    hasOther: false,
                    isRequired: true,
                    choices: ["나는 슬프지 않다", "나는 슬프다", "나는 항상 슬프고 기운을 낼 수 없다.","나는 너무나 슬프고 불행해서 도저히 견딜 수 없다."]
                }
            ]
        }, {
            title: "",
            questions: [
                {
                    type: "checkbox",
                    name: "",
                    title: "",
					hasOther: false,
                    isRequired: true,
                    choices: ["나는 앞날에 대해서 별로 낙심하지 않는다.","나는 앞날에 대해서 용기가 나지 않는다.",
							"나는 앞날에 대해 기대할 것이 아무것도 없다고 느낀다.", "나는 앞날은 아주 절망적이고 나아질 가망이 없다고 느낀다."
                        
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