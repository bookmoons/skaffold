module local.tld/fuzz

go 1.13

replace github.com/GoogleContainerTools/skaffold => ../../../..

replace gopkg.in/russross/blackfriday.v2 v2.0.1 => github.com/russross/blackfriday/v2 v2.0.1

require (
	github.com/GoogleContainerTools/skaffold v0.0.0-00010101000000-000000000000
	github.com/davecgh/go-spew v1.1.1
	github.com/dvyukov/go-fuzz v0.0.0-20190808141544-193030f1cb16
	github.com/dvyukov/go-fuzz/go-fuzz-dep v0.0.0
	github.com/elazarl/go-bindata-assetfs v1.0.0 // indirect
	github.com/fuzzitdev/fuzzit/v2 v2.4.46 // indirect
	github.com/gogo/protobuf v1.2.2-0.20190723190241-65acae22fc9d
	github.com/golang/protobuf v1.3.2
	github.com/google/gofuzz v1.0.0
	github.com/imdario/mergo v0.3.6
	github.com/json-iterator/go v1.1.7
	github.com/krishicks/yaml-patch v0.0.10
	github.com/mitchellh/go-homedir v1.1.0
	github.com/modern-go/concurrent v0.0.0-20180306012644-bacd9c7ef1dd
	github.com/modern-go/reflect2 v1.0.1
	github.com/pkg/errors v0.8.1
	github.com/sirupsen/logrus v1.4.2
	github.com/spf13/pflag v1.0.3
	github.com/stephens2424/writerset v1.0.2 // indirect
	golang.org/x/crypto v0.0.0-20190701094942-4def268fd1a4
	golang.org/x/net v0.0.0-20190909003024-a7b16738d86b
	golang.org/x/oauth2 v0.0.0-20190604053449-0f29369cfe45
	golang.org/x/sys v0.0.0-20190904154756-749cb33beabd
	golang.org/x/text v0.3.2
	golang.org/x/time v0.0.0-20190308202827-9d24e82272b4
	google.golang.org/appengine v1.6.1
	gopkg.in/inf.v0 v0.9.1
	gopkg.in/yaml.v2 v2.2.2
	k8s.io/apimachinery v0.0.0-20190831074630-461753078381
	k8s.io/client-go v0.0.0-20190831074946-3fe2abece89e
	k8s.io/klog v0.4.0
	k8s.io/utils v0.0.0-20190801114015-581e00157fb1
	sigs.k8s.io/yaml v1.1.0
)
