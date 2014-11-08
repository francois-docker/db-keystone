Docker - Keystone-db container
==============
This container runs a keystone database

Requirements
------------
This container has no requirements but it is build with default values :

- `root password` - neutre
- `keystone db` - keystone : The database that will be used by keystone
- `keystone db user` - keystone : The user that has the permission on the keystone database
- `keystone db user password` - keystone : The password of the user that has permission on the database

Environment variables
----------
#### Mandatory environment variables

#### Optional environment variables

Usage
-----
#### Docker
Build as usual

```
cd keystone-mysql
docker build -t francois/keystone-mysql .
```

Run the container with necessary links

```
docker run --name somekeystonedb francois/keystone-db
```

#### Fleet
Create a symlink pointing to the keystone-db.service file available at :
https://github.com/francois-fleet/fleet_apps/blob/master/databases/db-keystone.service

```
git clone https://github.com/francois-fleet/fleet_apps.git
mkdir keystone-units
cd keystone-units
ln -s ../fleet_apps/databases/db-keystone.service db-keystone.service

fleet submit db-keystone.service
fleet start db-keystone.service
```

#### Kubernetes
Use the yaml files available at : https://github.com/francois-k8s/kube_apps
For the pod : databases/db-keystone-pod/yaml
For the mysql service : databases/db-keystone-service.yaml

```
git clone https://github.com/francois-k8s/kube_apps

kubecfg -c kube_apps/databases/db-keystone-pod.yaml create pods

kubecfg -c kube_apps/databases/db-keystone-service.yaml create services
```

Contributing
------------
1. Fork the repository on Github
2. Create a named feature branch (like `add_component_x`)
3. Write your change
4. Submit a Pull Request using Github

License and Authors
-------------------
Authors: François Billant <fbillant@gmail.com>
