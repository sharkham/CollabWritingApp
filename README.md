# Collab Writing App

Collab Writing App is a Rails(6)-based web application intended for use by writers working on group novel projects together. Within the app, a user can create a novel, only visible to them, and invite other users to the novel project to allow them to edit and add to it.

## Installation

1. Fork the repository
2. Clone the files to your computer
3. Navigate to the `CollabWritingApp` directory.
4. Run `bundle install`
5. Run `rails db:migrate`

## Usage

After following the installation instructions, enable login via Google by creating a `.gitignore` file and an `.env` file in the root directory. This can be done by typing `touch .gitignore` then `touch .env` in the terminal.

In `.gitignore`, add `.env`.

Go to Google Developers Console and create an app. Select credentials, then 'create credentials', and select ‘Create OAuth client ID’, then select ‘web application’. Here you'll be able to see your client ID and client secret.

In `.env`, add the following code, and replace `12345` with your client ID and `678910` with your client secret.

`GOOGLE_CLIENT_ID=12345`
`GOOGLE_CLIENT_SECRET=678910`

Back in the Google Developers Console, add `http://[whateverURLyourerunningthison.com]/auth/google_oauth2/callback` to the list of Authorized Redirect URIs. To run it as a Rails server from your computer, it would be `http://localhost:3000/auth/google_oauth2/callback`.

After this, to run it from your computer, type `rails s` in the terminal (while still in the `CollabWritingApp` directory) to start the server.

Instructions on setting up Google OAuth are paraphrased from this wonderful [article](https://medium.com/@rachel.hawa/google-authentication-strategy-for-rails-5-application-cd37947d2b1b).

## Contributing
Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.

Please make sure to update tests as appropriate.

## License
[MIT](https://choosealicense.com/licenses/mit/)

