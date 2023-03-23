{ lib
, buildGoModule
, fetchFromGitHub
, installShellFiles
}:

buildGoModule rec {
  pname = "gopass-jsonapi";
  version = "1.15.4";

  src = fetchFromGitHub {
    owner = "gopasspw";
    repo = "gopass-jsonapi";
    rev = "v${version}";
    hash = "sha256-gizUFoe+oAmEKHMlua/zsR+fUltGw2cp98XAgXzCm0U=";
  };

  vendorHash = "sha256-vMrP6rC0uPsRyFZdU2E9mPp031eob+36NcGueNP1Y7o=";

  subPackages = [ "." ];

  nativeBuildInputs = [ installShellFiles ];

  ldflags = [
    "-s" "-w" "-X main.version=${version}" "-X main.commit=${src.rev}"
  ];

  meta = with lib; {
    description = "Enables communication with gopass via JSON messages";
    homepage = "https://www.gopass.pw/";
    license = licenses.mit;
    maintainers = with maintainers; [ maxhbr ];
  };
}
