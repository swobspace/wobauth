Wobauth dummy application
=========================

To use this test dummy application, check out the source code from git, 
change directory to test/dummy and run the application:

```bash
git clone https://github.com/swobspace/wobauth.git
bundle install
cd test/dummy
bin/rails server
```
Browse to [localhost:3000](http://localhost:3000) and play around.

To login you must create an admin user, an admin role and the corresponding
authority. For convenience you can use db/seed.rb (not yet available, coming soon).

