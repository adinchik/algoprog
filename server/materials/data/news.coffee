import news from "../lib/news"
import newsItem from "../lib/newsItem"

export default allNews = () ->
    return news([
        newsItem("3 марта занятия в лицее 40 не будет", String.raw"""
            <p>3 марта занятия в лицее 40 не будет.</p>
        """),
        newsItem("Летняя компьютерная школа и прочие летние школы", String.raw"""
            <p>Добавлена информация <a href='/material/sis'>про ЛКШ</a> и <a href='/material/summerSchools'>про летние школы вообще</a>. <b>Обязательно прочитайте информацию про ЛКШ; я настоятельно рекомендую всем школьникам, кто может, туда поехать.</b></p>
        """),
        newsItem("Про занятия в ННГУ", String.raw"""
            <p>В текущем учебном году занятий в ННГУ точно не будет.</p>
            <p>При этом я готов проводить онлайн-занятия через zoom или другие сервисы видеоконференций, если будут желающие участвовать в таких занятиях. Формат занятий будет как всегда — никаких лекций, вы сами решаете задачи, просто вам будет легче меня спросить о чем-нибудь. Пишите, если вы хотите участвовать в таком занятии, сразу указывайте время, когда вам удобнее. Думаю, если такие занятия будут, то участвовать в них смогут все желающие (не только нижегородские школьники), хотя я буду отдавать приоритет нижегородским школьникам (в первую очередь в плане выбора удобного времени).</p>
            <p>Также я планирую возобновить <a href='/material/ochn_high'>онлайн-занятия для старших уровней</a>. Занятия устроены аналогично тому, как были устроены такие занятия в прошлом году в ННГУ — я готовлю некоторый контест на codeforces, вы будете решаете (в виртуальном режиме, контест будет доступен несколько дней), после чего мы в онлайн-режиме обсуждаем и разбираем задачи и обсуждаем разные олимпиадные новости. Время такого обсуждения можно выбрать; пишите, если вы планируете участвовать и у вас есть пожелания по времени. Это занятия тоже будут доступны для всех желающих, хотя если ваш уровень ниже чем примерно 2В или 3А, то скорее всего вам будет сложно; и опять-таки приоритет будет отдаваться сильным нижегородским школьникам.</p>
        """),
        newsItem("Время от времени наблюдается кратковременная недоступность сайта", String.raw"""
            <p>После технических работ (переноса алгопрога на другой хостинг) время от времени наблюдается кратковременная недоступность сайта (в те моменты, когда стартует новая версия кода алгопрога). Я знаю об этой проблеме и изучаю, как ее можно решить. Пока в такой ситуации просто подождите несколько минут. Если у вас из-за такой недоступности возникли проблемы (например, не прошла оплата), напишите мне.</p>
        """),
        newsItem("Опрос про алгопрог", String.raw"""
            Ответьте, пожалуйста, <a href="https://docs.google.com/forms/d/e/1FAIpQLSdDXTZ1yMHp_yk3Di5ie4BcI9HXKtnlJ8iyp9iupdX4fezqag/viewform?usp=sf_link">на несколько вопросов</a>. Тем, кто уже отвечал — я там добавил несколько вопросов, можете ответить еще раз.
        """),
    ])