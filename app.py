from aiohttp import web
import MeCab

routes = web.RouteTableDef()
mecab = MeCab.Tagger()

@routes.post('/')
async def root(request):
    text = (await request.read()).decode()
    return web.Response(text=mecab.parse(text))

app = web.Application()
app.add_routes(routes)

if __name__ == '__main__':
    web.run_app(app)
