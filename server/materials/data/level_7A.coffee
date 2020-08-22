import label from "../lib/label"
import level from "../lib/level"
import problem from "../lib/problem"
import topic from "../lib/topic"

topic_25516 = () ->
    return topic("Z-функция", "7А: Задачи на Z-функцию", [
        label("<p>См. <a href=\"https://sis.khashaev.ru/2008/august/b-prime/\">видеозаписи лекций ЛКШ.2008.B'</a>, раздел \"Алгоритмы на строках\".<br>\n<a href=\"https://e-maxx.ru/algo/z_function\">Теория на e-maxx</a><br>\n<a href=\"https://ru.wikipedia.org/wiki/Z-функция\">Теория в википедии (!)</a><br>\n<a href=\"https://neerc.ifmo.ru/wiki/index.php?title=Z-функция\">Теория на сайте ИТМО</a><br>\n<a href=\"https://habrahabr.ru/post/113266/\">Теория на хабре</a></p>"),
        problem(1324),
        problem(1326),
        problem(3369),
    ])

topic_16559 = () ->
    return topic("Сложные задачи на поиск в глубину", "7А: Сложные задачи на поиск в глубину", [
        label("<p>Теория вся есть в том же тексте про поиск в глубину (ссылка выше на уровне 3), только теперь вам уже надо знать тут вообще всё.</p>\n<p>Еще можете посмотреть на e-maxx, в частности, там есть <a href=\"https://e-maxx.ru/algo/strong_connected_components\">простое доказательство алгоритма построения сильносвязных компонент</a>.</p>"),
        problem(1991),
        problem(3360),
        problem(3883),
        problem(390),
        problem(113441),
    ])

topic_25514 = () ->
    return topic("Алгоритм Кнута-Морриса-Пратта (КМП)", "7А: Задачи на КМП", [
        label("<p>\nСм. <a href=\"https://sis.khashaev.ru/2008/august/b-prime/\">видеозаписи лекций ЛКШ.2008.B'</a>, раздел \"Алгоритмы на строках\".<br>\n<a href=\"https://e-maxx.ru/algo/prefix_function\">Теория на e-maxx</a><br>\n<a href=\"https://habrahabr.ru/post/191454/\">Теория на хабре</a><br>\nМожете в интернете поискать еще.<br>\nПомимо собственно поиска подстроки в строке, префикс-функция также нередко имеет другие полезные применения. Задачи на это ниже тоже есть.<br>\nКакие-то из задач ниже, наверное, были ранее в задачах на хеши. Решите их повторно с использованием КМП.</p>"),
        problem(1323),
        problem(99),
        problem(100),
        problem(1943),
    ])

export default level_7A = () ->
    return level("7А", [
        label("<p>Чтобы перейти на следующий уровень, надо решить все задачи.</p>"),
        topic_16559(),
        topic_25514(),
        topic_25516(),
    ])