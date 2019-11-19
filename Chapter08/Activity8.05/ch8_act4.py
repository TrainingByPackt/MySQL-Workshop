import json
data = json.loads(open('MuseaGalleries.json','r').read())
musea_collection = db.create_collection('musea_galleries')
for musea in data:
    musea_collection.add(musea).execute()
