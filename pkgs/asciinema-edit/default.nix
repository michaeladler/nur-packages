{ lib, fetchFromGitHub, buildGoModule }:

buildGoModule {
  pname = "asciinema-edit";
  version = "0.0.6-unstable-2019-01-30";

  src = fetchFromGitHub {
    owner = "cirocosta";
    repo = "asciinema-edit";
    rev = "1c0971ae232aef9637035f7a5ce3a98fadc7c181";
    hash = "sha256-7wKSYaBsxZbmySnwgTKUDW2zRxtkgLHjXw0jALiNhC4=";
  };

  vendorHash = "sha256-WW+oUIg60DMGvAm5pcy4iklnih7HABeVkC/ydi5M/I8=";

  postPatch = ''
    rm -rf vendor Gopkg.lock Gopkg.toml

    cat <<EOF > go.mod
module github.com/cirocosta/asciinema-edit

go 1.18

require (
	github.com/onsi/ginkgo v1.5.0
	github.com/onsi/gomega v1.4.0
	github.com/pkg/errors v0.9.1
	gopkg.in/urfave/cli.v1 v1.20.0
)

require (
	github.com/golang/protobuf v1.5.2 // indirect
	golang.org/x/net v0.0.0-20180702212446-ed29d75add3d // indirect
	golang.org/x/sys v0.0.0-20180627142611-7138fd3d9dc8 // indirect
	golang.org/x/text v0.3.0 // indirect
	gopkg.in/yaml.v2 v2.2.1 // indirect
)
EOF
    cat <<EOF > go.sum
github.com/golang/protobuf v1.5.0/go.mod h1:FsONVRAS9T7sI+LIUmWTfcYkHO4aIWwzhcaSAoJOfIk=
github.com/golang/protobuf v1.5.2 h1:ROPKBNFfQgOUMifHyP+KYbvpjbdoFNs+aK7DXlji0Tw=
github.com/golang/protobuf v1.5.2/go.mod h1:XVQd3VNwM+JqD3oG2Ue2ip4fOMUkwXdXDdiuN0vRsmY=
github.com/google/go-cmp v0.5.5/go.mod h1:v8dTdLbMG2kIc/vJvl+f65V22dbkXbowE6jgT/gNBxE=
github.com/onsi/ginkgo v1.5.0 h1:uZr+v/TFDdYkdA+j02sPO1kA5owrfjBGCJAogfIyThE=
github.com/onsi/ginkgo v1.5.0/go.mod h1:lLunBs/Ym6LB5Z9jYTR76FiuTmxDTDusOGeTQH+WWjE=
github.com/onsi/gomega v1.4.0 h1:p/ZBjQI9G/VwoPrslo/sqS6R5vHU9Od60+axIiP6WuQ=
github.com/onsi/gomega v1.4.0/go.mod h1:C1qb7wdrVGGVU+Z6iS04AVkA3Q65CEZX59MT0QO5uiA=
github.com/pkg/errors v0.9.1 h1:FEBLx1zS214owpjy7qsBeixbURkuhQAwrK5UwLGTwt4=
github.com/pkg/errors v0.9.1/go.mod h1:bwawxfHBFNV+L2hUp1rHADufV3IMtnDRdf1r5NINEl0=
golang.org/x/net v0.0.0-20180702212446-ed29d75add3d h1:B2RL9y12DFXBWEdHqZW1ts6ymJLN0FdBwL2mOY5zbCs=
golang.org/x/net v0.0.0-20180702212446-ed29d75add3d/go.mod h1:mL1N/T3taQHkDXs73rZJwtUhF3w3ftmwwsq0BUmARs4=
golang.org/x/sys v0.0.0-20180627142611-7138fd3d9dc8 h1:RI4LLZfYDSosZMJ7FzhhEQbwo7tA8Bp9Vhml1PukQsg=
golang.org/x/sys v0.0.0-20180627142611-7138fd3d9dc8/go.mod h1:STP8DvDyc/dI5b8T5hshtkjS+E42TnysNCUPdjciGhY=
golang.org/x/text v0.3.0 h1:g61tztE5qeGQ89tm6NTjjM9VPIm088od1l6aSorWRWg=
golang.org/x/text v0.3.0/go.mod h1:NqM8EUOU14njkJ3fqMW+pc6Ldnwhi/IjpwHt7yyuwOQ=
golang.org/x/xerrors v0.0.0-20191204190536-9bdfabe68543/go.mod h1:I/5z698sn9Ka8TeJc9MKroUUfqBBauWjQqLJ2OPfmY0=
google.golang.org/protobuf v1.26.0-rc.1/go.mod h1:jlhhOSvTdKEhbULTjvd4ARK9grFBp09yW+WbY/TyQbw=
google.golang.org/protobuf v1.26.0 h1:bxAC2xTBsZGibn2RTntX0oH50xLsqy1OxA9tTL3p/lk=
google.golang.org/protobuf v1.26.0/go.mod h1:9q0QmTI4eRPtz6boOQmLYwt+qCgq0jsYwAQnmE0givc=
gopkg.in/check.v1 v0.0.0-20161208181325-20d25e280405 h1:yhCVgyC4o1eVCa2tZl7eS0r+SDo693bJlVdllGtEeKM=
gopkg.in/check.v1 v0.0.0-20161208181325-20d25e280405/go.mod h1:Co6ibVJAznAaIkqp8huTwlJQCZ016jof/cbN4VW5Yz0=
gopkg.in/urfave/cli.v1 v1.20.0 h1:NdAVW6RYxDif9DhDHaAortIu956m2c0v+09AZBPTbE0=
gopkg.in/urfave/cli.v1 v1.20.0/go.mod h1:vuBzUtMdQeixQj8LVd+/98pzhxNGQoyuPBlsXHOQNO0=
gopkg.in/yaml.v2 v2.2.1 h1:mUhvW9EsL+naU5Q3cakzfE91YhliOondGd6ZrsDBHQE=
gopkg.in/yaml.v2 v2.2.1/go.mod h1:hI93XBmqTisBFMUTm0b8Fm+jr3Dg1NNxqwp+5A1VGuI=
EOF

  '';

  meta = with lib; {
    description = "asciinema casts post-production tools";
    homepage = "https://github.com/cirocosta/asciinema-edit";
    license = licenses.mit;
  };
}
