React = require('react')

export default News = (props) ->
    <div>
        <h1>Новости</h1>
        {
        res = []
        a = (el) -> res.push(el)
        for m, i in props.news.materials
            a <div key={i}>
                <h2>{m.title}</h2>
                <div dangerouslySetInnerHTML={{__html: m.content}}/>
            </div>
        res
        }
    </div>
