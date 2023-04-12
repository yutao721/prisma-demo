import express from 'express';
import { URL } from 'url';

const app = express();

app.use(express.json());
app.use(express.urlencoded({ extended: true }));

app.use(async (req, res) => {
  const parsedUrl = new URL(req.url!, 'http://localhost');
  const url = parsedUrl.pathname.replace(/^\/+|\/+$|\.+/g, "");
  const segments = url.split("/");
  const method = segments.pop()!;
  const controller = segments.join("/");
  if (parsedUrl.pathname == 'favicon.ico') { return }
  try {
    let params;
    if (req.method === 'GET') {
      params = req.query;
    } else {
      params = req.body;
    }

    const api = require("./" + controller);
    if (api[method]) {
      const result = await api[method](params, req);
      res.header('Content-Type', 'application/json');
      res.header('Access-Control-Allow-Origin', '*');
      res.end(JSON.stringify({ code: 0, message: 'OK', data: result }));
    }
  } catch (e) {
    // eslint-disable-next-line no-console
    console.error(e);

    if (e instanceof Error) {
      let code = (e as any).code;
      if (typeof code !== 'number') {
        code = 1;
      }
      res.header('Content-Type', 'application/json');
      res.end(JSON.stringify({ code, message: e.message }));
    }
  }
});

app.listen(4000, () =>
  console.log(
    '🚀 Server ready at: http://localhost:4000',
  ),
)

export default app;