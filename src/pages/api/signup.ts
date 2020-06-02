import { NextApiRequest, NextApiResponse} from "next";
const sqlite = require('sqlite');
const sqlite3 = require('sqlite3');
// import sqlite from 'sqlite';
// import sqlite3 from 'sqlite3';
import { hash } from 'bcrypt';

export default async function signUp(req: NextApiRequest, res: NextApiResponse)
{
    const db = await sqlite.open({
        filename: './mydb.sqlite',
        driver: sqlite3.Database
    });

    if( req.method === 'POST' ) {

        hash(req.body.password, 10, async function(err, hash)
        {
            // Store hash in your password DB.
            const statement = await db.prepare(
                'INSERT INTO person (name, email, password) values (?, ?, ?)'
            );
            const result = await statement.run(
                req.body.name,
                req.body.email,
                hash
            );

            const person = await db.all('SELECT * FROM person');
            res.json(person)
        });

    } else {
        res.status(405).json({message: 'We only support POST.'})
    }

}