import React from "react";
import image from "../../images/rectangle@3x.jpg";

export default function LoginBackground(): JSX.Element {
  return (
    <div
      style={{
        height: "100%",
        width: "100%",
        background: `url(${image}) no-repeat center center / cover`
      }}
    ></div>
  );
}
