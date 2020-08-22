import label from './label'
import MaterialList from "./MaterialList"

class Topic extends MaterialList
    constructor: (@title, @contestTitle, materials) ->
        super(materials)

    build: (context) ->
        properties = 
            _id: context.generateId()
            type: "topic"
            title: @title
            treeTitle: @contestTitle

        material = await super.build(context, properties, {keepSubmaterials: true})
        material.treeTitle = @contestTitle

        return material

export default topic = (args...) -> () -> new Topic(args...)