import React, { useEffect, useState } from "react";

import eye from "../media/images/eye.png";
import countapi from "countapi-js";

const ViewCount = ({ path }) => {
  const [count, setCount] = useState(0);

  useEffect(() => {
    countapi.visits(path).then((result) => {
      setCount(result.value);
    });
  }, [path]);

  return (
    <div
      style={{
        width: "max-content",
        fontSize: 14,
        padding: 10,
        backgroundColor: "purple",
        margin: "auto",
        marginTop: 50,
        borderRadius: 10,
        textAlign: "center",
        display: "flex",
        flexDirection: "row",
        alignItems: "center",
        fontWeight: "bold",
      }}
    >
      <img
        src={eye}
        alt="Views"
        style={{ width: 32, height: 32, marginRight: 10 }}
      />
      {count}
    </div>
  );
};

export default ViewCount;
